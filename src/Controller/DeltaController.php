<?php

namespace App\Controller;

use App\Entity\Jeu;
use App\Entity\User;
use App\Form\JeuType;
use App\Repository\JeuRepository;
use App\Repository\UserRepository;
use App\Service\JeuService;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DeltaController extends AbstractController
{
    /**
     * @Route("/delta", name="delta")
     * @IsGranted("ROLE_USER")
     */
    public function delta(JeuService $service): Response
    {
        $jeu2 = $service->getUserJeuByCateg("nom");
        
        return $this->render('delta/index.html.twig', [
            'jeu' => $jeu2
        ]);
    }

    /**
     * @Route("/delta/{id}/show", name="show_delta", methods={"GET"})
     * @IsGranted("ROLE_USER")
     */
    public function show(Jeu $jeu): Response
    {
        return $this->render('delta/show.html.twig', [
            'jeu' => $jeu
        ]);
    }

    /**
     * @Route("/delta/add", name="add_delta", methods={"GET","POST"})
     * @IsGranted("ROLE_USER")
     */
    public function add(Request $request, EntityManagerInterface $em): Response
    {
        $jeu = new Jeu();
        $form = $this->createForm(JeuType::class, $jeu);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if (!empty($jeu->getImage())) {
                $file = $jeu->getImage();
                $filename = md5(uniqid()) . '.' . $file->guessExtension();
                $file->move($this->getParameter('upload_directory'), $filename);
                $jeu->setImage($filename);
            }

            $em->persist($jeu);
            $message = $jeu->getNom() . ' a été ajouté au catalogue';
            $this->addFlash('success', $message);
            $em->flush();

            return $this->redirectToRoute('delta');
        }

        return $this->render('delta/add.html.twig', [
            'jeu' => $jeu,
            'formJeu' => $form->createView()
        ]);
    }

    /**
     * @Route("/delta/{id}/edit", name="edit_delta", methods={"GET","POST"})
     * @IsGranted("ROLE_USER")
     */
    public function edit(Jeu $jeu, Request $request, EntityManagerInterface $em): Response
    {
        $oldImage = $jeu->getImage();
        $form = $this->createForm(JeuType::class, $jeu);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {

            if (!empty($jeu->getImage())) {
                $file = $jeu->getImage();
                $filename = md5(uniqid()) . '.' . $file->guessExtension();
                $file->move($this->getParameter('upload_directory'), $filename);
                $jeu->setImage($filename);
            } else {
                $jeu->setImage($oldImage);
            }

            $em->persist($jeu);
            $message = $jeu->getNom() . ' a été modifié';
            $this->addFlash('success', $message);
            $em->flush();

            return $this->redirectToRoute('delta');
        }

        return $this->render('delta/edit.html.twig', [
            'jeu' => $jeu,
            'formJeu' => $form->createView()
        ]);
    }

    /**
     * @Route("/delta/{id}/delete", name="delete_delta", methods={"POST"})
     * @IsGranted("ROLE_USER")
     */
    public function delete(Jeu $jeu, Request $request): Response
    {
        if ($this->isCsrfTokenValid('delete' . $jeu->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($jeu);
            $entityManager->flush();
        }

        $message = $jeu->getNom() . ' a été supprimé du catalogue';
        $this->addFlash('success', $message);

        return $this->redirectToRoute('delta');
    }

    /**
     * @Route("/delta/nom", name="delta_nom")
     * @IsGranted("ROLE_USER")
     */
    public function Nom(JeuService $service): Response
    {
        $jeu2 = $service->getUserJeuByCateg("nom");
        
        return $this->render('delta/index.html.twig', ['jeu'=>$jeu2]);
    }

    /**
     * @Route("/delta/editeur", name="delta_editeur")
     * @IsGranted("ROLE_USER")
     */
    public function Editeur(JeuService $service): Response
    {
        $jeu2 = $service->getUserJeuByCateg("editeur");

        return $this->render('delta/index.html.twig', ['jeu'=>$jeu2]);
    }

    /**
     * @Route("/delta/categorie", name="delta_categorie")
     * @IsGranted("ROLE_USER")
     */
    public function Categorie(JeuService $service): Response
    {
        $jeu2 = $service->getUserJeuByCateg("categorie");

        return $this->render('delta/index.html.twig', ['jeu'=>$jeu2]);
    }

    /**
     * @Route("/delta/langue", name="delta_langue")
     * @IsGranted("ROLE_USER")
     */
    public function Langue(JeuService $service): Response
    {
        $jeu2 = $service->getUserJeuByCateg("langue");

        return $this->render('delta/index.html.twig', ['jeu'=>$jeu2]);
    }

    /**
     * @Route("/delta/sortie", name="delta_sortie")
     * @IsGranted("ROLE_USER")
     */
    public function Sortie(JeuService $service): Response
    {
        $jeu2 = $service->getUserJeuByCateg("sortie");

        return $this->render('delta/index.html.twig', ['jeu'=>$jeu2]);
    }

    /**
     * @Route("/delta/prix", name="delta_prix")
     * @IsGranted("ROLE_USER")
     */
    public function Prix(JeuService $service): Response
    {
        $jeu2 = $service->getUserJeuByCateg("prix");

        return $this->render('delta/index.html.twig', ['jeu'=>$jeu2]);
    }
}