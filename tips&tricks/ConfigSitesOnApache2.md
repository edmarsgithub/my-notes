# Configurando dois sites no Apache2 no Ubuntu do WSL

Este tutorial mostra como configurar dois sites no Apache2, rodando no Ubuntu dentro do WSL (Windows Subsystem for Linux), usando os nomes de domínio "site1" e "site2".

## 1. Instalar o Apache2 no Ubuntu do WSL

Caso o Apache2 ainda não esteja instalado, execute os seguintes comandos no terminal do WSL:

```bash
sudo apt update
sudo apt install apache2
```

## 2. Criar diretórios para os sites

Crie os diretórios onde os arquivos dos seus sites serão armazenados:

```bash
sudo mkdir -p /var/www/site1
sudo mkdir -p /var/www/site2
```

Defina as permissões apropriadas:

```bash
sudo chown -R $USER:$USER /var/www/site1
sudo chown -R $USER:$USER /var/www/site2
sudo chmod -R 755 /var/www
```

## 3. Criar uma página de teste para cada site

Crie um arquivo `index.html` para testar cada site:

```bash
echo "<html><head><title>Site1</title></head><body><h1>Bem-vindo ao site Site1!</h1></body></html>" | sudo tee /var/www/site1/index.html
echo "<html><head><title>Site2</title></head><body><h1>Bem-vindo ao site Site2!</h1></body></html>" | sudo tee /var/www/site2/index.html
```

## 4. Configurar os Virtual Hosts no Apache

Crie arquivos de configuração de virtual hosts para cada site no diretório `/etc/apache2/sites-available/`:

### Para o site "site1":

```bash
sudo nano /etc/apache2/sites-available/site1.conf
```

Adicione o seguinte conteúdo:

```apache
<VirtualHost *:80>
    ServerAdmin webmaster@site1
    ServerName site1
    DocumentRoot /var/www/site1
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

### Para o site "site2":

```bash
sudo nano /etc/apache2/sites-available/site2.conf
```

Adicione o seguinte conteúdo:

```apache
<VirtualHost *:80>
    ServerAdmin webmaster@site2
    ServerName site2
    DocumentRoot /var/www/site2
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

## 5. Habilitar os sites no Apache

Ative os sites recém-configurados com os seguintes comandos:

```bash
sudo a2ensite site1.conf
sudo a2ensite site2.conf
```

Desative o site padrão para evitar conflitos:

```bash
sudo a2dissite 000-default.conf
```

Em seguida, reinicie o Apache para aplicar as mudanças:

```bash
sudo systemctl restart apache2
```

## 6. Editar o arquivo de hosts no Windows

Agora, você precisa editar o arquivo de hosts do Windows para redirecionar os domínios "site1" e "site2" para o WSL (localhost).

1. No Windows, abra o arquivo de hosts com permissões de administrador. O caminho é:

   ```
   C:\Windows\System32\drivers\etc\hosts
   ```

2. Adicione as seguintes linhas no final do arquivo:

   ```
   127.0.0.1 site1
   127.0.0.1 site2
   ```

3. Salve o arquivo.

## 7. Testar os sites

Agora, você deve ser capaz de acessar seus sites em um navegador web. Tente os seguintes endereços:

- [http://site1](http://site1)
- [http://site2](http://site2)

Se tudo estiver configurado corretamente, você verá as páginas de boas-vindas que criou anteriormente para cada site.

## Solução de problemas

- **Se o Apache não iniciar corretamente**: Verifique a sintaxe dos arquivos de configuração com o comando:

  ```bash
  sudo apachectl configtest
  ```

- **Certifique-se de que o WSL esteja em execução**: Caso o WSL esteja inativo, os sites não serão acessíveis.

---

Isso configurará os dois sites, "site1" e "site2", no Apache, rodando no Ubuntu dentro do WSL, e você poderá acessá-los usando os respectivos nomes de domínio.
```
