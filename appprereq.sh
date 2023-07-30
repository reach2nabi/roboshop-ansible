    - name: Copy file
      ansible.builtin.copy:
        src: {{component}}.service
        dest: /etc/systemd/system/{{component}}.service

    - name: Execute the command in remote shell;
      ansible.builtin.shell: curl -sL https://rpm.nodesource.com/setup_lts.x | bash

    - name: Add the user 'roboshop'
      ansible.builtin.user:
      name: roboshop

    - name: Recursively remove directory
      ansible.builtin.file:
        path: /app
        state: absent

    - name: Create a directory
      ansible.builtin.file:
        path: /app
        state: directory

    - name: Unarchive a file with extra options
      ansible.builtin.unarchive:
        src: https://roboshop-artifacts.s3.amazonaws.com/{{component}}.zip
        dest: /app
        remote_src: yes
