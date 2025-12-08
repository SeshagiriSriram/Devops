FROM ubuntu
#ENTRYPOINT ["/bin/echo"] 
ENTRYPOINT ["/bin/bash", "-c"] 
#ENTRYPOINT ["/bin/bash"] 

# use below line to pass args. In this case it's Hello World as default value
#applicable when Entrypoint is echo  
#CMD ["Hello,s World"]
# Be careful of below scenario. Why??? 
# CMD "Hello World"
# The above is called the shell form and gets translated to /bin/sh -c "Hello World". 
# so when passed to /bin/echo you will see /bin/sh -c "Hello World" 
#CMD ["/usr/bin/ls","-la"]
#CMD ["/usr/bin/ls -la"]
CMD ["/usr/bin/ls -la"]

# CMD  * 
# given /bin/bash as ENTRYPOINT, this will fail since * will be expanded and usually cannot execute command. 
# if * evaluated to bin obj somefolder, bash will try to execute bin and just fail. 
# CMD ["*"]  
# given /bin/bash as ENTRYPOINT, this will be treated as exec * which will fail since * does not exist as a file.  = No such file or directory. 
# CMD ["/usr/bin/ls", "-al", "*"] 
# given /bin/bash as ENTRYPOINT, This will give ls output only
# CMD ["/usr/bin/ls -al *"] 
# given /bin/bash as ENTRYPOINT, This will give ls -la output as expected
# NB: This will work only if you use -c as ENTRYPOINT 
# CMD * 
# given /bin/echo as ENTRYPOINT, this will be treated as echo "/bin/sh -c *"    
# CMD ["*"] 
# given /bin/echo as ENTRYPOINT,  treated as just plain *  ie. echo "*" 
# CMD ["Hello, World"] 
# given /bin/echo as ENTRYPOINT,  prints Hello World*
	