/**
 * 
 */
package com.tera.sabamiso.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

import com.tera.sabamiso.business.model.User;

/**
 * @author usr160056
 *
 */
@Component
public class UserDao {
    public User getUser(String id){
        //ここではハードコードしていますが、本当はDBから値を取得します。
        User user = new User();
        try {
           user.setId("123");
           user.setName("寺沢");
           user.setAge(21);
           SimpleDateFormat f =new SimpleDateFormat("yyyy/MM/dd");
           user.setUpDate(f.parse("2012/04/01"));
        } catch (ParseException e) {}
           return user;
        }
         
        public void updateUser(User user){
          //DBに値を更新する処理を書きます。ここでは省略。
        }

}
