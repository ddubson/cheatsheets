start:
	@hugo serve -D

update-content:
	@git add -N .
	@git add .
	@git commit -m "Auto-update content"

push:
	@git push origin head:main
