FROM mratrend/hexo
LABEL author=mratrend email=mratrend@163.com
RUN sed -i 's/landscape/hexo-theme-skapp/g' _config.yml && \
yum install make gcc gcc-c++ -y && \
npm install -g cnpm --registry=https://registry.npm.taobao.org && \
cnpm install --save hexo-autoprefixer hexo-filter-cleanup hexo-generator-feed hexo-generator-sitemap hexo-renderer-sass hexo-renderer-swig mamboer/lunr.js moment node-sass object-assign && \
cnpm install hexo-deployer-git --save && \
cd themes && git clone https://github.com/Mrminfive/hexo-theme-skapp.git && \
yum clean all && rm -rf /var/cache/yum/*
ENTRYPOINT ["hexo","server"]
