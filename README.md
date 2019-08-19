# Site List to PDF
A bash script that uses wkhtmltopdf to generate PDFs for a list of websites specified in a site-list.txt file.

**Note:** This tool is very bare bones, and has a lot of room for improvement. I most likely won't update it soon, because it works for my own purposes.


## Install wkhtmltopdf
**Mac / OS X:** To install on a mac, simply do: ```brew cask install wkhtmltopdf```

**Linux:** To install on a debian-based machine, do: ```sudo apt install wkhtmltopdf```

## Install + Run
1. Download **site_to_pdf.sh**
2. Run ```chmod +x site_to_pdf.sh```
3. Run ```./site_to_pdf.sh```

The tool will loop through all of the websites listed in site-list.txt. If there is no site-list.txt, the program will create one containing ```example.com``` and generate a PDF for it.

## Known Issues
- Right now it doesn't handle subdomains very well. For example, ```en.wikipedia.org``` will generate a file called ```en.pdf``` instead of ```wikipedia.pdf```
- It doesn't handle long paths very well either. For example, ```example.com/edit/admin``` would create ```example-edit.pdf```, and ```example.com/edit/user``` would also create ```example-edit.pdf```, resulting in one overwriting the other.
