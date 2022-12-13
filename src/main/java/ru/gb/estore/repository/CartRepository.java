package ru.gb.estore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.gb.estore.model.Cart;

import java.util.Optional;

public interface CartRepository extends JpaRepository<Long, Cart> {

    public Optional<Cart> findById(long id);
}
