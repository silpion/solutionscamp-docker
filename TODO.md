  - container
!   - reg (docker registry server)
!   - app (generated con for an application)


! - vagrant multi host project
    - host Ubuntu 12.04/raring base box an aws
!   - vagrant multi host networking
!   - 3 hosts
!     - reg (Ubuntu 12.04/raring, silpion/dockerreg)
!     - ws  (Ubuntu 12.04/raring, build app con with Dockerfile)
!     - app (Ubuntu 12.04/raring, run app con)
    - provisioning
      - reg
!       - install docker
!       - fetch reg con
!       - start reg con
      - adm
!       - install docker
!       - build app con
!       - tag
*       - push
          - verify: https://github.com/dotcloud/docker-registry/tree/master/contrib/golang_impl
      - app
!       - install docker
(!)     - docker pull app con
(!)     - docker run app con


  - docker
!   - provide ready to go reg con (samalba/docker-registry)
!     - host reg con on aws
!   - build app con automagically with Dockerfile


  - slides
    - showoff?!
    - keynote
