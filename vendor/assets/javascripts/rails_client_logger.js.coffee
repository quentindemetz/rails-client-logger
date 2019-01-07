if (!window.jsLoggerBasePath) { window.jsLoggerBasePath = ''; }
if (!window.jsLoggerUrl) { window.jsLoggerUrl = "/logger/rails_client_logger/log"; }

window.jsLogger = {
  invoke(level, message) {
    var req = new XMLHttpRequest();
    req.open('POST', `${window.jsLoggerBasePath}${window.jsLoggerUrl}`)
    req.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content)
    req.setRequestHeader("Content-Type", "application/json");
    req.send(JSON.stringify({level, message}))
  },

  debug(message) {
    return this.invoke('debug', message);
  },

  info(message) {
    return this.invoke('info', message);
  },

  warn(message) {
    return this.invoke('warn', message);
  },

  error(message) {
    return this.invoke('error', message);
  },

  fatal(message) {
    return this.invoke('fatal', message);
  }
};
