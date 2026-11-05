package com.puskar.skillbridge.model;

import jakarta.persistence.*;

import java.io.Serial;
import java.io.Serializable;

@Entity
@Table(name = "applications")
public class Application implements Serializable {

    @Serial
    private static final long serialVersionUID = 231433L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
}
