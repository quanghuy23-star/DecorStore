/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;
import model.*;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public void insertOrder(User u, Cart cart, String notes) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "insert into [Order] ([user_id],[order_date],[total],[notes]) values (?,GETDATE(), ?, ?)";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, u.getId());
            ps.setDouble(2, cart.getTotalMoney());
            ps.setString(3, notes);
            ps.executeUpdate();

            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            ps = connection.prepareStatement(sql1);
            rs = ps.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt(1);
                for (CartItem item : cart.getItems()) {
                    String sql2 = "insert into [OrderDetail] ([order_id],[product_id]  ,[price],[quantity]) values (?,?, ?, ?)";
                    ps = connection.prepareStatement(sql2);
                    ps.setInt(1, oid);
                    ps.setInt(2, item.getProduct().getId());
                    ps.setDouble(3, item.getProduct().getPrice());
                    ps.setInt(4, item.getQuantity());
                    ps.executeUpdate();
                }
            }
            String sql3 = "update [Product] set [stock] = [stock] - ? "
                    + "where product_id = ?";
            ps = connection.prepareStatement(sql3);
            for (CartItem item : cart.getItems()) {
                ps.setInt(1, item.getQuantity());
                ps.setInt(2, item.getProduct().getId());
                ps.executeUpdate();
            }

        } catch (Exception e) {
        }
    }

    public Vector<Order> getAllOrderByuId(int uid) {
        Vector<Order> ol = new Vector<>();
        String sql = "  select * from [Order] where user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ol.add(new Order(rs.getInt(1), new User(rs.getInt(2)), rs.getDate(3), rs.getDouble(4), rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return ol;
    }

    public Vector<OrderDetail> getAllOrderDetailByoId(int oid) {
        Vector<OrderDetail> odl = new Vector<>();
        String sql = " SELECT  p.*, o.* FROM [OrderDetail] o, Product p where o.product_id = p.product_id and o.order_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), new Category(rs.getInt("category_id")), rs.getString(6), rs.getString(7), rs.getDate(8));
                odl.add(new OrderDetail(rs.getInt("detail_id"), rs.getInt("order_id"), p, rs.getDouble("price"), rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return odl;
    }

    public int getNumberOrder() {
        String sql = "  select count(*)from  OrderDetail";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public double getTotalProfit() {
        String sql = "  select sum(price*quantity) from OrderDetail";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

}
