package ru.gb.estore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.gb.estore.model.Order;

import java.util.Optional;

public interface OrderRepository extends JpaRepository<Long, Order> {
    Optional<Order> findById(long id);
}
