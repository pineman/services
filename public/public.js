const http = require('http');
const fs = require('fs');
const path = require('path');
const child_process = require('child_process');

process.chdir('/public');
http.createServer((req, res) => {
	let ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
	let dir = path.basename(decodeURI(req.url));
	console.log(`[${ip}] ${dir}: request`);
	let stat = fs.statSync(dir, {throwIfNoEntry: false})
	if (stat === undefined || !stat.isDirectory()) {
		console.log(`[${ip}] ${dir}: not a dir`);
		res.writeHead(404);
		res.end();
		return;
	}
	let zip = child_process.spawn('zip', ['-0', '-r', '-', dir]);
	res.writeHead(200, {'Content-Type': 'application/zip'});
	zip.stdout.pipe(res);
	console.log(`[${ip}] ${dir}: success`);
}).listen(8035);

