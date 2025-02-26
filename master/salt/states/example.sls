install_nginx:
  pkg.installed:
    - name: nginx

start_nginx:
  service.running:
    - name: nginx
    - require:
      - pkg: install_nginx