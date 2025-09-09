package com.booking.boot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.booking.boot.entity.User;




public interface UserRepository extends JpaRepository<User, Integer>{

}
