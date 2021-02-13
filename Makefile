start:
	@hugo serve -D

update-content:
	@git add -N **/*.md
	@git add **/*.md
	@git commit -m "Auto-update content"

push:
	@git push origin head:main
