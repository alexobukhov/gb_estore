package ru.gb.estore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.gb.estore.model.Cart;
import ru.gb.estore.service.CartCervice;
import ru.gb.estore.service.OrderService;

import java.util.List;

@RestController
public class StatisticController {

    @Autowired
    OrderService orderService;

    @Autowired
    CartCervice cartCervice;

    @GetMapping("/statistic")
    public List<Cart> getStatistic() {
        return cartCervice.getCarts();
    }
}
