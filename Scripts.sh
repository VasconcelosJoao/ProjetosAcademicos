# git clone git@github.com:VasconcelosJoao/SistemasEmbarcados2.git
# git clone git@github.com:VasconcelosJoao/SistemasEmbarcados.git
# git clone git@github.com:VasconcelosJoao/Projeto-Final-SBD2.git
# git clone git@github.com:VasconcelosJoao/SAE-SBD2.git
# git clone git@github.com:VasconcelosJoao/LanguageLab.git
# git clone git@github.com:VasconcelosJoao/2022.2-MEI.git
# git clone git@github.com:VasconcelosJoao/2022.2-SimplesNacional.git
# git clone git@github.com:VasconcelosJoao/2023.2-OneShot.git
# git clone git@github.com:VasconcelosJoao/Cebraspe-Tracker.git
# git clone git@github.com:VasconcelosJoao/Projeto-Integrador-I-UNB.git
# git clone git@github.com:VasconcelosJoao/Projeto-Integrador-II.git
# git clone git@github.com:VasconcelosJoao/Projeto-Integrador-I.git
# git clone git@github.com:VasconcelosJoao/2024.1_G3_My_gov.git


# find . -mindepth 2 -type d -name ".git"

# find . -mindepth 2 -type d -name ".git" -exec bash -c 'for d; do mv "$d" "${d%/.git}/.git_old"; done' _ {} +

# find . -mindepth 2 -type d -name ".git_old" -exec bash -c 'for d; do mv "$d" "${d%/.git_old}/.git"; done' _ {} +

# mv .git_old .git
# git remote remove origin
# git remote add origin https://github.com/SEU-USUARIO/NOVO-REPO.git
# git push -u origin main