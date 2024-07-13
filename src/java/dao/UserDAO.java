/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import model.Product;
import model.User;

/**
 *
 * @author chi
 */
public class UserDAO extends DBContext {

    public Vector<User> getAllUser() {
        Vector<User> list = new Vector<>();
        String sql = "select * from [Users]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserById(int id) {
        String sql = "select * from [Users]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), rs.getString(8));
                return u;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void inserUser(String name, String email, String phone, String address, String pass) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([username]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[address]\n"
                + "           ,[gender]\n"
                + "           ,[phone]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,1\n"
                + "           ,?\n"
                + "           ,'US')";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateUser(String name, String email, String phone, String address, String pass, int gender, int userid) {
        String sql = " update [Users] set [user_name]=? ,[email] =? ,[password] =? ,[address]=?, [gender]=? ,[phone]=? where [user_id] =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, address);
            ps.setInt(5, gender);
            ps.setString(6, phone);
            ps.setInt(7, userid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getNumberUser() {
        String sql = "select count(*)from  Users";
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

    public static void main(String[] args) {
        UserDAO d = new UserDAO();
        System.out.println(d.getAllUser().toString());
    }
}
