  - container
!   - idx (docker index server)
    - app (generated con for an application)


! - vagrant multi host project
    - host Ubuntu 12.04/raring base box an aws
!   - vagrant multi host networking
!   - 3 hosts
!     - idx (Ubuntu 12.04/raring, silpion/dockeridx)
!     - ws  (Ubuntu 12.04/raring, build app con with Dockerfile)
!     - app (Ubuntu 12.04/raring, run app con)
    - provisioning
      - idx
!       - install docker
!       - fetch idx con
?       - start idx con
      - ws
!       - install docker
*       - build app con
      - app
!       - install docker
(!)     - docker pull app con
(!)     - docker run app con


  - docker
!   - provide ready to go idx con (samalba/docker-registry)
!     - host idx con on aws
*   - build app con automagically with Dockerfile


  - slides
    - showoff?!
