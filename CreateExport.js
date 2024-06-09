const fs = require('fs');
const { mdToPdf } = require('md-to-pdf');

function findFiles(doc, s) {
    return new Promise(async (resolve) => {
        let mdFiles = [];
        fs.readdir(doc, async (err, files) => {
            for (const file of files) {

                if (fs.statSync(`${doc}/${file}`).isDirectory()) {
                    mdFiles = mdFiles.concat(await findFiles(`${doc}/${file}`, s));
                } else {
                    if (file.endsWith(s)) {
                        mdFiles.push(`${doc}/${file}`);
                    }
                }

            }
            resolve(mdFiles);
        });

    });
}

(async () => {

    if(fs.existsSync('inleveren')) {
        await fs.rmSync('inleveren', { recursive: true });
    }

    if(fs.existsSync('inleveren.zip')) {
        await fs.rmSync('inleveren.zip');
    }

    await fs.mkdirSync('inleveren');

    await fs.mkdirSync('inleveren/Doc');
    // find all md files in the doc folder recursively
    const files = await findFiles('doc', '.md');

    // convert all md files to pdf

    for (const file of files) {
        const pdf = await mdToPdf({ path: file }).catch(console.error);

        let fileName = file.replace('.md', '.pdf');
        if (pdf) {
            if (fileName.includes('/')) {
                // create the folder
                let folders = fileName.split('/');
                let path = 'inleveren/doc';
                for (let i = 1; i < folders.length - 1; i++) {
                    path += '/' + folders[i];
                    if (!fs.existsSync(path)) {
                        fs.mkdirSync(path);
                    }
                }
            }
            fs.writeFileSync('inleveren/' + fileName, pdf.content);
        }
    }

    // create the zip file
    const { create } = require('archiver');
    const output = fs.createWriteStream('inleveren.zip');
    const archive = create('zip', {});

    archive.pipe(output);
    archive.directory('inleveren/', false);
    archive.finalize();


})();


