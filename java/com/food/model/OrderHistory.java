package com.food.model;

import java.time.LocalDateTime;

public class OrderHistory {

    private int orderId;
    private String foodName;
    private String foodImage;
    private LocalDateTime orderDate;
    private double totalAmount;
    private String status;

    public OrderHistory() {
    }

    public OrderHistory(int orderId, String foodName,
            String foodImage, LocalDateTime orderDate,
            double totalAmount, String status) {

        this.orderId = orderId;
        this.foodName = foodName;
        this.foodImage = foodImage;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodImage() {
        return foodImage;
    }

    public void setFoodImage(String foodImage) {
        this.foodImage = foodImage;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}