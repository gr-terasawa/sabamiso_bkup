/**
 * 
 */
package com.tera.sabamiso.contoller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tera.sabamiso.business.model.User;
import com.tera.sabamiso.business.service.UserService;

/**
 * ���̃A�m�e�[�V���������āAcomponent-scan�������Controller�Ƃ��Ĉ����܂��B
 */
@Controller
@RequestMapping(value = "/user/")
public class UserContoller {

    @Autowired
    private UserService userService;

    /**
     * form���f���̃o�C���_�[�̏������B���N�G�X�g�p�����^�����f���ɕϊ����邽�тɌĂ΂��B
     */
    @InitBinder("form")
    public void initBinderForm(WebDataBinder binder) {
        // �o�C���h����Ƃ��̓��t�̃t�H�[�}�b�g�w��B
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, "user.upDate",
                new CustomDateEditor(dateFormat, true));

        // User�I�u�W�F�N�g�̂����Auser.name�p�����^���󂯎�肽���Ȃ��ꍇ
        binder.setAllowedFields("user.age", "user.upDate");
    }

    /**
     * ���f���I�u�W�F�N�g�̏�����
     */
    @ModelAttribute("form")
    public Form newRequest(@RequestParam(required = false, value = "user.id") String userId) {
        Form f = new Form();
        //
        User user = null;
        if (userId == null) {
            user = new User("123", "����");
        } else {
            user = this.userService.getUser(userId);
        }
        //
        f.setUser(user);
        return f;
    }

    // ���N�G�X�g����------------------------------------------
    @RequestMapping(value = "edit/", method = RequestMethod.GET)
    public String input(Form form) {
        // ����newRequest�Ń��f����DB������o���A�ݒ肵�Ă���̂ŉ�������K�v���Ȃ�
        return "user/edit-input";
    }

    @RequestMapping(value = "edit/confirm", method = RequestMethod.POST)
    public String confirm(@Valid Form form, BindingResult result) {
        // @Valid���w�肵�����f���͑Ó����`�F�b�N�����s�����B
        if (result.hasErrors()) {
            return "user/edit-input";
        }
        return "user/edit-confirm";
    }

    @RequestMapping(value = "edit/finish", method = RequestMethod.POST)
    public String finish(@Valid Form form, BindingResult result)
            throws Exception {
        if (result.hasErrors()) {
            return "user/edit-input";
        }

        // �f�[�^�X�V
        this.userService.updateUser(form.user);
        return "user/edit-finish";
    }

    // ---------------------------------------------
    // �t�H�[��(HTML�p�̃p�����^���󂯎���悤�ɍ���Ă����������悢�Ǝv���܂�)
    public static class Form {
        @Valid
        private User user;

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }
    }

}
