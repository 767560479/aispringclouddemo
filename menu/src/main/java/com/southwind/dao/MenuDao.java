package com.southwind.dao;

import com.southwind.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;


@Mapper
@Component
public interface MenuDao {
    public List<Menu>findAll(int index,int limit);
    @Select("select * from t_menu ")
    List<Menu>find();
    int count();
    Menu findById(Integer id);
    void save(Menu menu);
    void update(Menu menu);
    void deleteById(Integer id);

    List<Menu>findAllToTest();

}
