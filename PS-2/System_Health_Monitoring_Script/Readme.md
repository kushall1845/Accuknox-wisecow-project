
# How to Use

Save the script

```bash
sudo vim /usr/local/bin/monitor_script.sh
````

Make it executable

```bash
chmod +x /usr/local/bin/monitor_script.sh
```

Run manually or schedule with cron

```bash
script.sh
```

or

```bash
crontab -e
```

Choose any file editor of your choice

Add:

```
*/1 * * * * /usr/local/bin/monitor_script.sh
```

(the script gets executed every 1 minute)

```

---

Would you like me to add syntax highlighting for the cron line too (so it looks like code when viewed on GitHub)?
```
