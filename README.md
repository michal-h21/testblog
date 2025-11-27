# Build test for my blog

Test files for my website setup. See [https://www.kodymirus.cz/testblog/](https://www.kodymirus.cz/testblog/) for details.

# How to use it as a template

You can put your TeX files in subdirectories of the `texposts` directory. Each document has it's 
own subdirectory. 

To start a new blog, you need to remove the documentation files first, using these commands:

```bash
$ find texposts -mindepth 1 -maxdepth 1 -type d \
  ! -name cookiecutter-post \
  -exec rm -rf {} +





