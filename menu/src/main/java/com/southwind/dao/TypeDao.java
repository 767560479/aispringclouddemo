package com.southwind.dao;

import com.southwind.entity.Type;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface TypeDao {
    Type findById(Integer id);

    List<Type> findAll();
}
