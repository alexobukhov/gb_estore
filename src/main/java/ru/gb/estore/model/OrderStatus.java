package ru.gb.estore.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@Table(name = "orders_statuses")
public class OrderStatus {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "title")
    private String title;
}
