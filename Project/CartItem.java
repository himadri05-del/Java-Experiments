package com.shopsphere.model;
import java.math.BigDecimal;
public class CartItem {
 private Product product; private int quantity;
 public CartItem(Product p,int q){product=p;quantity=q;}
 public Product getProduct(){return product;} public int getQuantity(){return quantity;} public void setQuantity(int q){quantity=q;}
 public BigDecimal getSubtotal(){return product.getSalePrice().multiply(BigDecimal.valueOf(quantity));}
}
