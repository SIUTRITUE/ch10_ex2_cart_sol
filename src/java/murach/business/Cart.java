package murach.business;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable
{
    private ArrayList<LineItem> items;
    
    public Cart()
    {
        items = new ArrayList<LineItem>();
    }
    
    public ArrayList<LineItem> getItems()
    { 
        return items;
    }
    
    public int getCount()
    { 
        return items.size();
    }
    
    public void addItem(LineItem item)
    {
        String code = item.getProduct().getCode();
        int quantity = item.getQuantity();
        for (int i = 0; i < items.size(); i++)
        {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getCode().equals(code))
            {
                // Cộng dồn số lượng thay vì ghi đè
                lineItem.setQuantity(lineItem.getQuantity() + quantity);
                return;
            }
        }
        items.add(item);
    }
    
    public void removeItem(LineItem item)
    {
        String code = item.getProduct().getCode();
        for (int i = 0; i < items.size(); i++)
        {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getCode().equals(code))
            {
                items.remove(i);
                return;
            }
        }
    }
    
    public void updateQuantity(String productCode, int newQuantity)
    {
        for (int i = 0; i < items.size(); i++)
        {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getCode().equals(productCode))
            {
                if (newQuantity <= 0) {
                    items.remove(i);
                } else {
                    lineItem.setQuantity(newQuantity);
                }
                return;
            }
        }
    }
    
    public double getTotal()
    {
        double total = 0.0;
        for (LineItem item : items)
        {
            total += item.getTotal();
        }
        return total;
    }
    
    public String getTotalCurrencyFormat()
    {
        java.text.NumberFormat currency = java.text.NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotal());
    }
}