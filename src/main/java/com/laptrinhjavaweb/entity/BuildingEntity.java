package com.laptrinhjavaweb.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "building")
@Getter
@Setter
public class BuildingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "street")
    private String street;

    @Column(name = "ward")
    private String ward;

    @Column (name = "district")
    private String district;

    @Column (name = "structure")
    private String structure;

    @Column(name = "numberofbasement ")
    private Integer numberOfBasement;

    @Column(name = "floorarea")
    private Integer floorArea;

    @Column(name = "direction")
    private String direction;

    @Column(name = "level")
    private String level;

    @Column(name = "rentprice")
    private Integer rentPrice;

    @Column (name = "rentpricedescription")
    private String  rentPriceDescription;

    @Column (name = "servicefee")
    private String serviceFee;

    @Column (name = "carfee")
    private String carFee;

    @Column (name = "motorbikefee")
    private String motorBikeFee;

    @Column (name = "overtimefee")
    private String overTimeFee;

    @Column (name = "waterfee")
    private String waterFee;

    @Column (name = "describearea")
    private String describeArea;

    @Column (name = "electricityfee")
    private String electriCityFee;

    @Column (name = "deposit")
    private String deposit;

    @Column (name = "payment")
    private String payment;

    @Column (name = "renttime")
    private String rentTime;

    @Column (name = "decorationtime")
    private String decoraTionTime;

    @Column (name = "brokeragefee")
    private String brokerageFee;

    @Column (name = "type")
    private String type;

    @Column (name = "note")
    private String note;

    @Column (name = "linkofbuilding")
    private String linkOfBuilding;

    @Column (name = "map")
    private String map;

    @Column (name = "image")
    private String image;

    @Column(name = "createddate")
    @CreatedDate
    private java.util.Date createdDate;

    @Column(name = "createdby")
    @CreatedBy
    private String createdBy;

    @Column(name = "modifieddate")
    @LastModifiedDate
    private Date modifiedDate;

    @Column (name = "managername")
    private String managerName;

    @Column (name = "managerphone")
    private Integer managerPhone;


    @OneToMany(mappedBy = "building", cascade = {CascadeType.PERSIST,CascadeType.MERGE, CascadeType.REMOVE}, orphanRemoval = true)
    private List<RentAreaEntity> rentAreas = new ArrayList<>();

    @ManyToMany
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid"),
            inverseJoinColumns = @JoinColumn(name = "staffid"))
    private List<UserEntity> users;

}