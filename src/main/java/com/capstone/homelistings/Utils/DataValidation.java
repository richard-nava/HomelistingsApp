package com.capstone.homelistings.Utils;

import java.util.Set;

import com.capstone.homelistings.model.Users;
import com.capstone.homelistings.repository.UsersRepository;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import javax.validation.executable.ExecutableValidator;
import javax.validation.metadata.BeanDescriptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class DataValidation implements Validator {
	
	@Autowired
	public UsersRepository userRepository;
	
	String emailRegex ="^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	
	
	// at least 8 chars, special character
	String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";

	public boolean supports(Class<?> clazz) {
		return Users.class.equals(clazz);
		}

		public void validate(Object o, Errors errors) {
		Users user = (Users) o;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fname", "NotEmpty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lname", "NotEmpty");


		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
		if (userRepository.getByEmail(user.getEmail()).isPresent()) {
		    errors.rejectValue("email", "size.user.unique");
		    }

		        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		        if (user.getPassword().length() <=0  ||  user.getPassword().length() < 4) {
		    errors.rejectValue("password", "size.user.password");
		    }
		        
		        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "NotEmpty");
		        if (!user.getPassword2().equals(user.getPassword())) {
		    errors.rejectValue("password2", "match.user.password2");
		    }
		        
		        if (!user.getEmail().matches(emailRegex)) {
		        errors.rejectValue("email", "size.user.email");
		    }
		        if (!user.getPassword().matches(passwordRegex)) {
			        errors.rejectValue("password", "size.user.password");
			    }
		        
		/*
		* if (!user.getPhone().matches(phoneRegex)) { errors.rejectValue("phone",
		* "size.user.phone"); }
		*/

		}
	
	
	@Override
	public <T> Set<ConstraintViolation<T>> validate(T object, Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> Set<ConstraintViolation<T>> validateProperty(T object, String propertyName, Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> Set<ConstraintViolation<T>> validateValue(Class<T> beanType, String propertyName, Object value,
			Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BeanDescriptor getConstraintsForClass(Class<?> clazz) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T unwrap(Class<T> type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExecutableValidator forExecutables() {
		// TODO Auto-generated method stub
		return null;
	}

}
