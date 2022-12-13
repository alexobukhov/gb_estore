package ru.gb.estore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.gb.estore.model.Cart;
import ru.gb.estore.model.Order;
import ru.gb.estore.repository.CartRepository;
import ru.gb.estore.repository.OrderRepository;

@Service
public class CartCervice {

    @Autowired
    CartRepository cartRepository;

    @Autowired
    OrderService orderService;
    @Autowired
    private OrderRepository orderRepository;

    public Cart addCart(Order order) {
        Cart cart = new Cart();
        cart.setOrderId(order);
        return cart;
    }

    public Cart getCart(long id) {
        return cartRepository.findById(id).orElse(null);
    }
}
