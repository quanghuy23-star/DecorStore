/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Category;
import model.User;

/**
 *
 * @author chi
 */
import java.util.Vector;

public class CategoryDAO extends DBContext {
    public Vector<Category> getAllCategory() {
        Vector<Category> list = new Vector<>();
        String sql = "select * from [Category]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        CategoryDAO d = new CategoryDAO();
        System.out.println(d.getAllCategory().toString());
    }
}

