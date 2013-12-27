/**
 * 
 */
package com.tera.sabamiso.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tera.sabamiso.business.model.User;
import com.tera.sabamiso.dao.UserDao;

/**
 * @author usr160056
 *
 */
@Component
public class UserService {
    @Autowired
    private UserDao userDao;
    public UserDao getUserDao() {
        return userDao;
    }
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
    public User getUser(String id){
        return this.userDao.getUser(id);
    }
    
    public void updateUser(User user){
        this.userDao.updateUser(user);
    }

}
