package com.shopsphere.dao;
import com.shopsphere.model.Product; import com.shopsphere.util.DB;
import java.sql.*; import java.util.*;
public class ProductDAO {
 private Product map(ResultSet r)throws SQLException{Product p=new Product();p.setProductId(r.getInt("product_id"));p.setName(r.getString("name"));p.setBrand(r.getString("brand"));p.setDescription(r.getString("description"));p.setPrice(r.getBigDecimal("price"));p.setDiscount(r.getBigDecimal("discount"));p.setStock(r.getInt("stock"));p.setImageUrl(r.getString("image_url"));p.setCategory(r.getString("category"));return p;}
 public List<Product> findAll(String q,String category)throws SQLException{
  List<Product> list=new ArrayList<>();String sql="SELECT p.*,c.name category FROM products p LEFT JOIN categories c ON p.category_id=c.category_id WHERE p.status=1 AND (?='' OR p.name LIKE ? OR p.brand LIKE ? OR c.name LIKE ?) AND (?='All' OR c.name=?) ORDER BY p.product_id";
  try(Connection c=DB.getConnection();PreparedStatement s=c.prepareStatement(sql)){String term=q==null?"":q.trim();s.setString(1,term);s.setString(2,"%"+term+"%");s.setString(3,"%"+term+"%");s.setString(4,"%"+term+"%");String cat=category==null||category.isBlank()?"All":category;s.setString(5,cat);s.setString(6,cat);try(ResultSet r=s.executeQuery()){while(r.next())list.add(map(r));}}return list;
 }
 public Product findById(int id)throws SQLException{try(Connection c=DB.getConnection();PreparedStatement s=c.prepareStatement("SELECT p.*,c.name category FROM products p LEFT JOIN categories c ON p.category_id=c.category_id WHERE p.product_id=? AND p.status=1")){s.setInt(1,id);try(ResultSet r=s.executeQuery()){return r.next()?map(r):null;}}}
 public List<String> categories()throws SQLException{List<String>a=new ArrayList<>();try(Connection c=DB.getConnection();PreparedStatement s=c.prepareStatement("SELECT name FROM categories ORDER BY name");ResultSet r=s.executeQuery()){while(r.next())a.add(r.getString(1));}return a;}
}
