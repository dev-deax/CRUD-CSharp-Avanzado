using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Entities
{
    class Teacher
    {
        private string name, lastname, password, email;
        private int id, age;
        private byte[] avatar;

        public string Name { get => name; set => name = value; }
        public string Lastname { get => lastname; set => lastname = value; }
        public string Password { get => password; set => password = value; }
        public string Email { get => email; set => email = value; }
        public int Id { get => id; set => id = value; }
        public int Age { get => age; set => age = value; }
        public byte[] Avatar { get => avatar; set => avatar = value; }
    }
}
