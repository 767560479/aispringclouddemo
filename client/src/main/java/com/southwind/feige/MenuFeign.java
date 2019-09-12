package com.southwind.feige;


import com.southwind.entity.Menu;
import com.southwind.entity.MenuVO;
import com.southwind.entity.Type;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;


@Component
@FeignClient(value = "menu")
public interface MenuFeign {

    @GetMapping("/menu/findAll/{index}/{limit}")
    MenuVO findAll(@PathVariable("index") int index, @PathVariable("limit") int limit);

    @DeleteMapping("/menu/deleteById/{id}")
    void deleteById(@PathVariable("id") Integer id);

    @GetMapping("/menu/findType")
    List<Type> findTypes();

    @GetMapping("/menu/findAllToTest")
    List<Menu>findAllToTest();
}
