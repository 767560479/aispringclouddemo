package com.southwind.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Menu {
    private Integer id;

    private String name;

    private Double price;

    private String flavor;


    private Type type;
}
