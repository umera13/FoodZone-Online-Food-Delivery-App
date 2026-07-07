package com.food.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    
    private Map<Integer, CartItem> items;

  
    private int restaurantId;

    public Cart() {
        items = new HashMap<>();
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void setItems(Map<Integer, CartItem> items) {
        this.items = items;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }


    public void addItem(Menu menu) {

        int menuId = menu.getMenuID();

        if(items.containsKey(menuId)) {

            CartItem item = items.get(menuId);

            item.setQuantity(item.getQuantity() + 1);
        }
        else {

            items.put(menuId, new CartItem(menu, 1));
        }
    }


    public void updateItem(int menuId, int quantity) {

        if(items.containsKey(menuId)) {

            if(quantity <= 0) {

                items.remove(menuId);
            }
            else {

                items.get(menuId).setQuantity(quantity);
            }
        }
    }


    public void removeItem(int menuId) {

        items.remove(menuId);
    }


    public void clear() {

        items.clear();

        restaurantId = 0;
    }


    public boolean isEmpty() {

        return items.isEmpty();
    }


    public double getTotalAmount() {

        double total = 0;

        for(CartItem item : items.values()) {

            total += item.getTotalPrice();
        }

        return total;
    }

}