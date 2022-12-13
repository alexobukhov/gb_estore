package ru.gb.estore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.gb.estore.model.Order;
import ru.gb.estore.repository.OrderRepository;

@Service
public class OrderService {

    @Autowired
    OrderRepository orderRepository;

    public Order getOrder(long id) {
        return orderRepository.findById(id).orElse(null);
    }
}
