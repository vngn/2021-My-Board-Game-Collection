<?php

namespace App\Repository;

use App\Entity\Jeu;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Jeu|null find($id, $lockMode = null, $lockVersion = null)
 * @method Jeu|null findOneBy(array $criteria, array $orderBy = null)
 * @method Jeu[]    findAll()
 * @method Jeu[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class JeuRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Jeu::class);
    }

    public function findByAllNom()
    {
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery('SELECT jeu FROM App\Entity\Jeu jeu ORDER BY jeu.nom');

        return $query->getResult();
    }

    public function findByAllNomUser($userId)
    {
        return $this->createQueryBuilder('j')
        ->join('j.users','u')
        ->andWhere('u.id = :val')
        ->setParameter('val', $userId)
        ->orderBy('j.nom', 'ASC')
        ->getQuery()
        ->getResult();
    }

    public function findByAllEditeur()
    {
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery('SELECT jeu FROM App\Entity\Jeu jeu ORDER BY jeu.editeur');

        return $query->getResult();
    }

    public function findByAllEditeurUser($userId)
    {
        return $this->createQueryBuilder('j')
        ->join('j.users','u')
        ->andWhere('u.id = :val')
        ->setParameter('val', $userId)
        ->orderBy('j.editeur', 'ASC')
        ->getQuery()
        ->getResult();
    }

    public function findByAllCategorie()
    {
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery('SELECT jeu FROM App\Entity\Jeu jeu ORDER BY jeu.categorie');

        return $query->getResult();
    }

    public function findByAllCategorieUser($userId)
    {
        return $this->createQueryBuilder('j')
        ->join('j.users','u')
        ->andWhere('u.id = :val')
        ->setParameter('val', $userId)
        ->orderBy('j.categorie', 'ASC')
        ->getQuery()
        ->getResult();
    }

    public function findByAllLangue()
    {
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery('SELECT jeu FROM App\Entity\Jeu jeu ORDER BY jeu.langue');

        return $query->getResult();
    }

    public function findByAllLangueUser($userId)
    {
        return $this->createQueryBuilder('j')
        ->join('j.users','u')
        ->andWhere('u.id = :val')
        ->setParameter('val', $userId)
        ->orderBy('j.langue', 'ASC')
        ->getQuery()
        ->getResult();
    }

    public function findByAllSortie()
    {
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery('SELECT jeu FROM App\Entity\Jeu jeu ORDER BY jeu.sortie');

        return $query->getResult();
    }

    public function findByAllSortieUser($userId)
    {
        return $this->createQueryBuilder('j')
        ->join('j.users','u')
        ->andWhere('u.id = :val')
        ->setParameter('val', $userId)
        ->orderBy('j.sortie', 'ASC')
        ->getQuery()
        ->getResult();
    }

    public function findByAllPrix()
    {
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery('SELECT jeu FROM App\Entity\Jeu jeu ORDER BY jeu.prix');

        return $query->getResult();
    }
    
    public function findByAllPrixUser($userId)
    {
        return $this->createQueryBuilder('j')
        ->join('j.users','u')
        ->andWhere('u.id = :val')
        ->setParameter('val', $userId)
        ->orderBy('j.prix', 'ASC')
        ->getQuery()
        ->getResult();
    }

    public function FindCatalogue($userId)
    {
        return $this->createQueryBuilder('j')
        ->addSelect('u')
        ->leftJoin('j.users','u')
        ->where('u.id is NULL')
        ->where('u.id = :val')
        ->setParameter(':val',$userId)
        ->orderBy('j.prix', 'ASC')
        ->getQuery()
        ->getResult();
    }

    // /**
    //  * @return Jeu[] Returns an array of Jeu objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('j')
            ->andWhere('j.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('j.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Jeu
    {
        return $this->createQueryBuilder('j')
            ->andWhere('j.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}