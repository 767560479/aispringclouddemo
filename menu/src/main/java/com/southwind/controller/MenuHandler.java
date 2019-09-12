package com.southwind.controller;

import com.southwind.dao.MenuDao;
import com.southwind.dao.TypeDao;
import com.southwind.entity.Menu;
import com.southwind.entity.MenuVO;
import com.southwind.entity.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/menu")
public class MenuHandler {
    @Value("${server.port}")
    private String port;

    @Autowired
    private MenuDao menuDao;

    @Autowired
    private TypeDao typeDao;

    @GetMapping("/index")
    public String index(){
        return "menu的端口:"+this.port;
    }

    @GetMapping("/findAll/{index}/{limit}")
    public MenuVO findAll(@PathVariable int index, @PathVariable int limit){
        return new MenuVO(0,"",menuDao.count(),menuDao.findAll(index,limit));
    }

    @GetMapping("/find")
    public List<Menu>find(){
        return menuDao.find();
    }

    @DeleteMapping("/deleteById/{id}")
    public void deleteById(@PathVariable("id") Integer id){
        menuDao.deleteById(id);
    }

    @GetMapping("/findType")
    public List<Type> findAll(){
        return typeDao.findAll();
    }

    @GetMapping("/findAllToTest")
    public List<Menu>findAllToTest(){return menuDao.findAllToTest();}
}
