package com.food.model;

public class OrderItemDetails {

    private String itemName;
    private int quantity;
    private double price;
    private double totalPrice;

    public OrderItemDetails() {
    }

    public OrderItemDetails(String itemName, int quantity,
            double price, double totalPrice) {

        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "OrderItemDetails [itemName=" + itemName
                + ", quantity=" + quantity
                + ", price=" + price
                + ", totalPrice=" + totalPrice + "]";
    }
}