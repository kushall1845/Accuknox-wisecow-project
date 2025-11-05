
# How to Use

Save the script

```bash
sudo vim /usr/local/bin/health_check.sh
````

Make it executable

```bash
chmod +x /usr/local/bin/health_check.sh
```

Run manually or schedule with cron

```bash
health_check.sh
```

or

```bash
crontab -e
```

Choose any file editor of your choice

Add:

```
*/1 * * * * /usr/local/bin/health_check.sh
```

(the script gets executed every 1 minute)


Here’s your complete and clean **`README.md`** file — including your original “How to use” section and the new “Test Locally (Optional)” section, with **no emojis** and fully Markdown-formatted:

---

````markdown
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

(the script gets executed for every 1 minute)

---

## 4. Test Locally (Optional)

If you don’t have an app running, use a mock server:

### Python HTTP Server

```bash
python3 -m http.server 8080
```

Then update the script:

```bash
APP_URL="http://localhost:8080"
```

Run:

```bash
bash /usr/local/bin/health_check.sh
```

You should see:

```
[2025-11-03 16:25:00] Application is UP (HTTP 200)
```







