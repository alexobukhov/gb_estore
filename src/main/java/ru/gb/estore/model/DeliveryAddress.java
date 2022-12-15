package ru.gb.estore.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "delivery_addresses")
@Data
public class DeliveryAddress {
    @Id
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "address")
    private String address;
}
