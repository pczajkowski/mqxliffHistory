# mqxliffHistory

If you're recording changes in your memoQ project it stores a lot of useful information. However to read it using memoQ client isn't most convenient. I've created a simple tool which will export history to easily readable HTML file.

First you need to export bilingual of given document with following options:
![Export bilingual](/export.png)

Then run:

	./extractHistory <your_mqxlz_file>


You'll receive *document.html* with full version history.

Feel free to use it however you want, but I take no responsibility for eventual damage.

It's using [incbin](https://github.com/graphitemaster/incbin) for embedding xsl files into binary.
