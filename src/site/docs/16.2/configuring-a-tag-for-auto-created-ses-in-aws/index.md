---
title: Configuring a Tag for Auto-created SEs in AWS
layout: layout162
---
Starting in Avi Vantage v16.2, a user may optionally pass AWS a single key-value pair to better control the instantiation of SEs in EC2.The key string and its corresponding value are passed to EC2 with every request to instantiate a new SE.

In accordance with <a href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">Amazon Web Services' documentation</a>, key names are 128 Unicode characters maximum, values 256 Unicode characters maximum. Choose from among alphanumeric characters (<code>[a-z], [A-Z], [0-9]</code>, and whitespace) plus the following special characters: <code>+ - = . _ : /</code>

### Configuring a Tag in Avi Vantage UI

<ol> 
 <li class="p1"><span class="s1">Browse to Infrastructure &gt; Clouds &gt; [AWS_Cloud_Name] &gt; Service Engine Group.</span><span class="s1"><a href="img/FIRST.png"><br> <img class="alignnone wp-image-11137" src="img/FIRST.png" alt="FIRST" width="600" height="140"><br> </a></span></li> 
 <li class="p1">Edit "Service Engine Group" &gt; Advanced. Click the Add Custom Tag hyperlink.<br> <a href="img/SECOND.png"><img class="alignnone wp-image-11138" src="img/SECOND.png" alt="SECOND" width="600" height="213"><br> </a></li> 
 <li class="p1"> <p class="p1"><span class="s1">Key in a custom tag key and a custom tag value. Then click Save at lower right.<br> <a href="img/THIRD.png"><img class="alignnone wp-image-11139" src="img/THIRD.png" alt="THIRD" width="600" height="235"></a></span></p> </li> 
</ol> 