package ru.gb.estore.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "cart")
@Data
public class Cart {

    @Id
    @Column(name = "id")
    private long id;

    @OneToOne
    @JoinColumn(name = "order_id")
    private Order orderId;
}
