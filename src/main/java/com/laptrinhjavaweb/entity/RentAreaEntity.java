package com.laptrinhjavaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "rentarea")
@Getter
@Setter
public class RentAreaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "value")
    private Integer value;

    @ManyToOne
    @JoinColumn(name = "buildingid", nullable = false)
    private BuildingEntity building;

    @Column (name = "createddate")
    private String createdDate;

    @Column (name = "modifieddate")
    private String modifiedDate;

    @Column (name = "createdby")
    private String createdBy;

    @Column (name = "modifiedby")
    private String modifiedBy;

}