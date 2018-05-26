INSERT INTO users (id, activation_code, address, email, first_name, active, last_name, password, phone, username)
      VALUES (1, null, 'localhost', 'grouper.merayalab@gmail.com',
              'Admin', TRUE,'Administrator', '2pRXCePJLjyH6xG4', '+380999-99-99-999', 'Administrator');

INSERT INTO user_role (user_id, roles)
      VALUES (1, 'SUPERUSER');