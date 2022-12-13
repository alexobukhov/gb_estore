package ru.gb.estore.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "products_images")
@Data
public class ProductImage {
    @Id
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name = "path")
    private String path;
}
