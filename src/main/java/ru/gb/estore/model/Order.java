package ru.gb.estore.model;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "orders")
@Data
public class Order {
    @Id
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "status_id")
    private OrderStatus status;

    @Column(name = "price")
    private double price;

    @Column(name = "delivery_price")
    private double deliveryPrice;

    @ManyToOne
    @JoinColumn(name = "delivery_address_id")
    private DeliveryAddress deliveryAddress;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "delivery_date")
    private LocalDateTime deliveryDate;

    @Column(name = "create_at")
    @CreationTimestamp
    private LocalDateTime createAt;

    @Column(name = "update_at")
    @CreationTimestamp
    private LocalDateTime updateAt;
}