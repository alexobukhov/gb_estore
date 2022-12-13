package ru.gb.estore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.gb.estore.model.Cart;
import ru.gb.estore.model.Order;
import ru.gb.estore.service.CartCervice;
import ru.gb.estore.service.OrderService;

@RestController
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CartCervice cartCervice;

    @Autowired
    OrderService orderService;

    @PostMapping("/add")
    public Cart addCart(long id) {
        Order order = orderService.getOrder(id);
        if (order == null) {
            return null;
        }
        return cartCervice.addCart(order);
    }
}
